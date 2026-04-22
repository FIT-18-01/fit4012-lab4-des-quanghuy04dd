from pathlib import Path
import re
import subprocess
import sys

root = Path('.')
errors = []
warnings = []

required_files = [
    'README.md',
    'report-1page.md',
    'src/caesar.cpp',
    'src/rail_fence.cpp',
    'data/input.txt',
    'tests/test_cases.md',
    'logs/run_log.md',
]

for rel in required_files:
    if not (root / rel).exists():
        errors.append(f'Thieu file bat buoc: {rel}')

if errors:
    print('\n'.join(f'::error::{e}' for e in errors))
    sys.exit(1)

readme = (root / 'README.md').read_text(encoding='utf-8')
report = (root / 'report-1page.md').read_text(encoding='utf-8')
caesar = (root / 'src/caesar.cpp').read_text(encoding='utf-8')
rail = (root / 'src/rail_fence.cpp').read_text(encoding='utf-8')
tests = (root / 'tests/test_cases.md').read_text(encoding='utf-8')
log = (root / 'logs/run_log.md').read_text(encoding='utf-8')

for keyword in ['Caesar', 'Rail Fence', 'GitHub']:
    if keyword.lower() not in readme.lower():
        errors.append(f'README.md thieu noi dung toi thieu lien quan den: {keyword}')

if 'TODO(student)' in caesar:
    errors.append('src/caesar.cpp van con TODO(student).')
if 'TODO(student)' in rail:
    errors.append('src/rail_fence.cpp van con TODO(student).')

if 'string caesar_decrypt' not in caesar:
    errors.append('src/caesar.cpp thieu ham caesar_decrypt().')
if 'string rail_fence_decrypt' not in rail:
    errors.append('src/rail_fence.cpp thieu ham rail_fence_decrypt().')
if 'read_message_from_file' not in rail:
    errors.append('src/rail_fence.cpp thieu ham read_message_from_file() cho Q8.')

if '| I LOVE YOU | 3 |  |  |' in report or '| I LOVE YOU | 2 |  |  |' in report:
    warnings.append('report-1page.md van con bang mau chua duoc dien day du.')

checked_tests = len(re.findall(r'^-\s*\[[xX]\]', tests, flags=re.MULTILINE))
if checked_tests < 6:
    errors.append('tests/test_cases.md can tick it nhat 6 test cases.')

checked_logs = len(re.findall(r'^-\s*\[[xX]\]', log, flags=re.MULTILINE))
if checked_logs < 6:
    errors.append('logs/run_log.md can danh dau it nhat 6 muc da chay.')

if 'Viết 3-5 dòng ngắn gọn ở đây.' in log or 'Viet 3-5 dong ngan gon o day.' in log:
    warnings.append('Nen thay placeholder trong phan tong ket cua run log.')

try:
    compile1 = subprocess.run(['g++', '-std=c++17', '-O2', '-Wall', '-Wextra', '-o', 'caesar_bin', 'src/caesar.cpp'], capture_output=True, text=True)
    if compile1.returncode != 0:
        errors.append(f'Khong bien dich duoc src/caesar.cpp: {compile1.stderr[:300]}')

    compile2 = subprocess.run(['g++', '-std=c++17', '-O2', '-Wall', '-Wextra', '-o', 'rail_bin', 'src/rail_fence.cpp'], capture_output=True, text=True)
    if compile2.returncode != 0:
        errors.append(f'Khong bien dich duoc src/rail_fence.cpp: {compile2.stderr[:300]}')
except FileNotFoundError:
    errors.append('Moi truong cham khong tim thay g++.')

if warnings:
    print('\n'.join(f'::warning::{w}' for w in warnings))

if errors:
    print('\n'.join(f'::error::{e}' for e in errors))
    sys.exit(1)

print('::notice::FIT4012 Lab 2 classical ciphers auto check passed.')
