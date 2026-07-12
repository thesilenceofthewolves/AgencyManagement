using AgencyManagement.API.Models.Enums;

namespace AgencyManagement.API.DTOs;

public class WorkerDto
{
    public int WorkerId { get; set; }

    public string FirstName { get; set; } = string.Empty;

    public string LastName { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string PhoneNumber { get; set; } = string.Empty;

    public WorkerStatus Status { get; set; }
}