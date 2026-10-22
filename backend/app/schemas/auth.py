from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime
from app.models.user import UserRole, AuthProvider

class RegisterRequest(BaseModel):
    name: str
    email: str
    password: str
    role: Optional[UserRole] = UserRole.user

class LoginRequest(BaseModel):
    email: str
    password: str

class UserOut(BaseModel):
    id: int
    name: str
    email: str
    profile_image: Optional[str] = None
    auth_provider: AuthProvider
    provider_user_id: Optional[str] = None
    role: UserRole
    permissions: List[str]
    created_at: Optional[datetime] = None

    class Config:
        from_attributes = True

class AuthResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    user: UserOut
    message: str = "Authentication successful"

class OAuthUrlResponse(BaseModel):
    provider: str
    authorization_url: str
