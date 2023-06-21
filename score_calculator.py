import subprocess
import re
import json
import sys

try:
    sys.stderr = sys.stdout
    command = "python -m pytest -q db_migrations/tests"
    # read result of tests
    result = subprocess.run(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    output = result.stdout
    errors = result.stderr
    print(output, file=sys.stdout)
    print(errors, file=sys.stdout)

    # Extract the number of successful and failed tests from the output
    success_tests = re.search(r'(\d+) passed', output)
    error_tests = re.search(r'(\d+) errors', output) 
    failed_tests = re.search(r'(\d+) failed', output)
    success_tests_number = float(success_tests.group(1) if success_tests else 0)
    failed_tests_number = float(failed_tests.group(1) if failed_tests else 0) + float(error_tests.group(1) if error_tests else 0)
    total_tests_number = success_tests_number + failed_tests_number
    percentage =  success_tests_number * 100 / total_tests_number
    score = int(round(percentage / 10))

    print("Number of successful tests:", success_tests_number)
    print("Number of total tests:", total_tests_number)
    print("Percentage of completed tests:", percentage)
    print("Score:", score)
    data = {"score": score}

    with open("score.json", "w") as file:
        json.dump(data, file)

    print ("Score saved")

finally:
    sys.exit(0)
