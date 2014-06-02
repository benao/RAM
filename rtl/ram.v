
`define D_WIDTH 16
`define A_WIDTH 4
`define A_MAX 16


module ram (clk_write, address_write,
  data_write, write_enable,
  clk_read, address_read, data_read);
  



  input                clk_write;
  input  [`A_WIDTH-1:0] address_write;
  input  [`D_WIDTH-1:0] data_write;
  input                write_enable;


  input                clk_read;
  input  [`A_WIDTH-1:0] address_read;
  output [`D_WIDTH-1:0] data_read;
  
  reg    [`D_WIDTH-1:0] data_read;
  

  reg [`D_WIDTH-1:0] memory [`A_MAX-1:0];


  always @(posedge clk_write) begin
    if (write_enable) begin
      memory[address_write] <= data_write;
    end
  end


  always @(posedge clk_read) begin
    data_read <= memory[address_read];
  end

endmodule
