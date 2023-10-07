using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace JuanYunis.Migrations
{
    public partial class UpdatedBasketsTableV1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ProductImages_Baskets_BasketId",
                table: "ProductImages");

            migrationBuilder.DropIndex(
                name: "IX_ProductImages_BasketId",
                table: "ProductImages");

            migrationBuilder.DropColumn(
                name: "BasketId",
                table: "ProductImages");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "BasketId",
                table: "ProductImages",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ProductImages_BasketId",
                table: "ProductImages",
                column: "BasketId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductImages_Baskets_BasketId",
                table: "ProductImages",
                column: "BasketId",
                principalTable: "Baskets",
                principalColumn: "Id");
        }
    }
}
