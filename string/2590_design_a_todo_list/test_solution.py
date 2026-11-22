import unittest
from pathlib import Path
from runpy import run_path

TodoList = run_path(str(Path(__file__).with_name("solution.py")))['TodoList']


class TestSolution(unittest.TestCase):
    def test_example_1(self):
        obj = TodoList()
        self.assertEqual(obj.addTask(1, 'Task1', 50, []), 1)
        self.assertEqual(obj.addTask(1, 'Task2', 100, ['P1']), 2)
        self.assertEqual(obj.getAllTasks(1), ['Task1', 'Task2'])
        self.assertEqual(obj.getAllTasks(5), [])
        self.assertEqual(obj.addTask(1, 'Task3', 30, ['P1']), 3)
        self.assertEqual(obj.getTasksForTag(1, 'P1'), ['Task3', 'Task2'])
        self.assertEqual(obj.completeTask(5, 1), None)
        self.assertEqual(obj.completeTask(1, 2), None)
        self.assertEqual(obj.getTasksForTag(1, 'P1'), ['Task3'])
        self.assertEqual(obj.getAllTasks(1), ['Task3', 'Task1'])


if __name__ == "__main__":
    unittest.main()
