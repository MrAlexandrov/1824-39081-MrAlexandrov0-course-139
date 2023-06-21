import subprocess
import re
import json
import sys

# read from stdin result of tests
result = sys.stdin.read()

print(result)

# Extract the number of successful and failed tests from the output
success_tests = re.search(r'(\d+) passed', result)
error_tests = re.search(r'(\d+) errors', result) 
failed_tests = re.search(r'(\d+) failed', result)
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
