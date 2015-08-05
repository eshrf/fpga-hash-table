import hash_table::*;

interface ht_if #( 
  parameter KEY_WIDTH      = 32,
  parameter VALUE_WIDTH    = 16,
  parameter BUCKET_WIDTH   = 8,
  parameter HEAD_PTR_WIDTH = 10
)( 
  input clk 
);

logic  [KEY_WIDTH-1:0]      key;
logic  [VALUE_WIDTH-1:0]    value;
ht_cmd_t                    cmd;

logic  [BUCKET_WIDTH-1:0]   bucket;

logic  [HEAD_PTR_WIDTH-1:0] head_ptr;
logic                       head_ptr_val;

logic                       valid;
logic                       ready;

modport master(
  output key,
  output value,
  output cmd,
  output bucket,
  output head_ptr,
  output head_ptr_val,
  output valid,
  input  ready
);

modport slave(
  input  key,
  input  value,
  input  cmd,
  input  bucket,
  input  head_ptr,
  input  head_ptr_val,
  input  valid,
  output ready
);

endinterface