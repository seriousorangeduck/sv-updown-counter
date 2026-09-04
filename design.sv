`timescale 1ns/1ps

module updown_counter (
    input  logic       clk,
    input  logic       rst,
    input  logic       up_down,
    output logic [3:0] count
);
    typedef enum logic [1:0] {
        ST_UP,
        ST_DOWN,
        ST_HOLD_4
    } state_t;
    state_t state;
    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 4'd0;
            state <= up_down ? ST_UP : ST_DOWN;
        end else begin
            case (state)
                ST_UP: begin
                    if (up_down) begin
                        count <= count + 4'd1;
                    end else if (count == 4) begin
                        count <= count;
                        state <= ST_HOLD_4;
                    end else begin
                        count <= count - 4'd1;
                        state <= ST_DOWN;
                    end
                end
                ST_DOWN: begin
                    if (up_down) begin
                        count <= count + 4'd1;
                        state <= ST_UP;
                    end else if (count == 4) begin
                        count <= count;
                        state <= ST_HOLD_4;
                    end else begin
                        count <= count - 4'd1;
                    end
                end
                ST_HOLD_4: begin
                    if (up_down) begin
                        count <= count + 4'd1;
                        state <= ST_UP;
                    end else begin
                        count <= count - 4'd1;
                        state <= ST_DOWN;
                    end
                end
                default: begin
                    count <= 4'd0;
                    state <= up_down ? ST_UP : ST_DOWN;
                end
            endcase
        end
    end
endmodule
