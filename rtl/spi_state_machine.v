module (
  wire clk,

  reg [7:0] cs,
  reg [7:0] speed,
  input wire [7:0] data_in,
  reg [7:0] crtl,
  reg [7:0] instruccion,
  
  output reg [7:0] data_out,
  

  input wire mosi,
  output miso,
  output sck
  );

localparam IDLE = 0;
localparam start = 1;
localparam data_flow = 2;

reg [7:0] state;
reg [7:0] saved_instru;
reg [7:0] contador;
reg spi_enable = 1;

assign sck = (spi_enable == 0) ? clk : 1'b1;

always @ (posedge clk) begin
case (state)
IDLE: begin
  if(spi_enable == 1) begin
  state <= start
  end
  else state <= IDLE;
  end

endcase
end  

always @ (posedge clk) begin
case(state)
IDLE: begin
  spi_enable <= 0;
  miso <= 0;
  mosi <= 0;
  contador <=7;
start: begin
  spi_enable <= 1;
  miso
end
endcase
end
 
endmodule