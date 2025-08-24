"""Base event classes for HRMS domain events."""

from datetime import datetime
from typing import Any, Dict, Optional
from dataclasses import dataclass
import uuid


@dataclass
class BaseEvent:
    """Base class for all domain events."""
    
    event_id: str
    event_type: str
    aggregate_id: str
    aggregate_type: str
    event_version: int
    occurred_at: datetime
    metadata: Dict[str, Any]
    
    def __post_init__(self):
        if not self.event_id:
            self.event_id = str(uuid.uuid4())
        if not self.occurred_at:
            self.occurred_at = datetime.utcnow()


@dataclass 
class DomainEvent(BaseEvent):
    """Domain event for business logic changes."""
    
    tenant_id: str
    user_id: Optional[str] = None


@dataclass
class IntegrationEvent(BaseEvent):
    """Integration event for cross-domain communication."""
    
    source_domain: str
    target_domains: list[str]
    correlation_id: Optional[str] = None
