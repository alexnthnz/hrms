// Shared TypeScript types for HRMS frontend applications

export interface BaseEntity {
  id: string;
  createdAt: string;
  updatedAt: string;
  createdBy: string;
  updatedBy: string;
}

export interface Employee extends BaseEntity {
  employeeNumber: string;
  personalInfo: PersonalInfo;
  contactInfo: ContactInfo;
  employmentInfo: EmploymentInfo;
}

export interface PersonalInfo {
  firstName: string;
  lastName: string;
  middleName?: string;
  preferredName?: string;
  dateOfBirth: string;
  gender?: string;
}

export interface ContactInfo {
  personalEmail: string;
  workEmail: string;
  phoneNumber: string;
  homeAddress: Address;
  workAddress?: Address;
}

export interface Address {
  street1: string;
  street2?: string;
  city: string;
  state: string;
  postalCode: string;
  country: string;
}

export interface EmploymentInfo {
  jobTitle: string;
  department: string;
  managerId?: string;
  startDate: string;
  endDate?: string;
  status: EmploymentStatus;
  type: EmploymentType;
}

export enum EmploymentStatus {
  ACTIVE = 'ACTIVE',
  INACTIVE = 'INACTIVE', 
  TERMINATED = 'TERMINATED',
  ON_LEAVE = 'ON_LEAVE'
}

export enum EmploymentType {
  FULL_TIME = 'FULL_TIME',
  PART_TIME = 'PART_TIME',
  CONTRACT = 'CONTRACT',
  INTERN = 'INTERN'
}

export interface PaginationRequest {
  page: number;
  pageSize: number;
  sortBy?: string;
  sortOrder?: 'asc' | 'desc';
}

export interface PaginationResponse {
  totalCount: number;
  totalPages: number;
  currentPage: number;
  pageSize: number;
}

export interface ApiResponse<T> {
  data: T;
  pagination?: PaginationResponse;
  error?: ErrorResponse;
}

export interface ErrorResponse {
  code: string;
  message: string;
  details?: string[];
}
