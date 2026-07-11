using AgencyManagement.API.Models.Enums;

namespace AgencyManagement.API.DTOs;

public class UpdateWorkerStatusDto
{
    public WorkerStatus Status { get; set; }

    public DateTime? EmploymentEndDate { get; set; }

    public string? EmploymentEndReason { get; set; }
}
