"""People domain events."""

from dataclasses import dataclass
from typing import Dict, Any
from .base import DomainEvent, IntegrationEvent


@dataclass
class EmployeeCreated(DomainEvent):
    """Event fired when a new employee is created."""
    
    employee_id: str
    employee_number: str
    personal_info: Dict[str, Any]
    employment_info: Dict[str, Any]
    
    def __post_init__(self):
        super().__post_init__()
        self.event_type = "people.employee.created"
        self.aggregate_type = "employee"
        self.aggregate_id = self.employee_id


@dataclass
class EmployeeUpdated(DomainEvent):
    """Event fired when an employee is updated."""
    
    employee_id: str
    updated_fields: list[str]
    previous_values: Dict[str, Any]
    new_values: Dict[str, Any]
    
    def __post_init__(self):
        super().__post_init__()
        self.event_type = "people.employee.updated"
        self.aggregate_type = "employee"
        self.aggregate_id = self.employee_id


@dataclass
class EmployeeTerminated(IntegrationEvent):
    """Integration event fired when an employee is terminated."""
    
    employee_id: str
    termination_date: str
    termination_reason: str
    final_pay_period: str
    
    def __post_init__(self):
        super().__post_init__()
        self.event_type = "people.employee.terminated"
        self.aggregate_type = "employee"  
        self.aggregate_id = self.employee_id
        self.source_domain = "people"
        self.target_domains = ["workforce-ops", "it-finance", "platform"]
