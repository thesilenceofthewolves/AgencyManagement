using AgencyManagement.API.Models.Enums;
using System.ComponentModel.DataAnnotations;

namespace AgencyManagement.API.DTOs;

public class CreateWorkerDto
{
    [Required]
    [StringLength(50)]
    public string FirstName { get; set; } = string.Empty;

    [Required]
    [StringLength(50)]
    public string LastName { get; set; } = string.Empty;

    [Required]
    [EmailAddress]
    public string Email { get; set; } = string.Empty;

    [Phone]
    [StringLength(20)]
    public string PhoneNumber { get; set; } = string.Empty;

    public WorkerStatus Status { get; set; } = WorkerStatus.Active;
}