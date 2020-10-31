import logging
import sys
import subprocess
from pathlib import Path
LOGGER = logging.getLogger( 'ycmd' )

def get_py_paths(cwd: str):
  LOGGER.info(f"\nget_py_paths(cwd = {cwd})\n")
  try:
      home_dir = str(Path.home())
      versions_path = f"{home_dir}/.pyenv/versions"
      
      envs = 'envs/'
      lib = '/lib'
      if versions_path in cwd and envs in cwd and lib in cwd:
        virtual_env = cwd[cwd.find(envs)+len(envs):cwd.rfind(lib)] 
      else:
        check_env = subprocess.run(['pyenv', 'local'], cwd=cwd, check=True, capture_output=True)
        virtual_env = check_env.stdout.decode('utf-8').replace('\n', '')

      LOGGER.info(f"\nvirtual_env: {virtual_env}\n")

      py_interpreter_path = f"{versions_path}/{virtual_env}/bin/python"

      py_v_raw = subprocess.run([py_interpreter_path, '-V'], check=True, capture_output=True)
      py_v = py_v_raw.stdout.decode('utf-8').replace('\n', '').replace('Python ', '').split('.')
      py_mm = f"python{py_v[0]}.{py_v[1]}"
      mmm = f"{py_v[0]}.{py_v[1]}.{py_v[2]}"

      site_pack_path = f"{versions_path}/{virtual_env}/lib/{py_mm}/site-packages"
      py_mm_zip_path = f"{versions_path}/{mmm}/lib/{py_mm}.zip"
      py_mm_path = f"{versions_path}/{mmm}/lib/{py_mm}"
      lib_dyn_path = f"{versions_path}/{mmm}/lib/{py_mm}/lib-dynload"
      
      paths = {
        'interpreter_path': py_interpreter_path,
        'sys_path': [site_pack_path, py_mm_zip_path, py_mm_path, lib_dyn_path]}
      
      LOGGER.info(f"\nPY_PATHS: \n{paths}\n")
      return paths

  except subprocess.CalledProcessError as e:
      LOGGER.error(f"\nerror: {e}\noutput: {e.output}\n")
      return None

def Settings( **kwargs ):
  LOGGER.info(f"\nRunning {__file__}..\n")
  LOGGER.info(f"\nSettings(kwargs = {kwargs})\n")

  filename = kwargs['filename']

  filepath = Path(filename)
  cwd = str(filepath.parent)

  return get_py_paths(cwd)

