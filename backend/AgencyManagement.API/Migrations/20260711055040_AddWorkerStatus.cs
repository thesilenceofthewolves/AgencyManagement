using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AgencyManagement.API.Migrations
{
    /// <inheritdoc />
    public partial class AddWorkerStatus : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "Workers");

            migrationBuilder.AddColumn<DateTime>(
                name: "EmploymentEndDate",
                table: "Workers",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "EmploymentEndReason",
                table: "Workers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "Workers",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EmploymentEndDate",
                table: "Workers");

            migrationBuilder.DropColumn(
                name: "EmploymentEndReason",
                table: "Workers");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Workers");

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "Workers",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
