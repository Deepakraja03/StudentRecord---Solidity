// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecord {
    struct Student {
    uint256 id;
    string name;
    uint256 age;
    string major;
    }

    mapping (uint256 => Student) private students;
    uint256 nextId = 1;
    uint256 count = 0;

    function addStudent(string memory name, uint256 age, string memory major) public {
        students[nextId] = Student(nextId,name,age,major);
        nextId++;
        count++;
    }

    function getStudent(uint256 id) public view returns (string memory ,uint256, string memory) {
        require(id > 0 && id < nextId,"Invalid Student ID");
        Student storage student = students[id];
        return (student.name, student.age, student.major);
    
    }

    function deleteStudent(uint256 id) public {
        require(id > 0 && id < nextId,"Invalid Student ID");
        delete students[id];
        count--;

    }

    function getId() public view returns (uint256) {
        return count;
    }
}