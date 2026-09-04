`timescale 1ns/1ps

module updown_counter_tb;
    logic clk = 1'b0;
    logic rst = 1'b1;
    logic up_down = 1'b1;
    logic [3:0] count;
    int errors = 0;
    updown_counter dut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );
    always #5 clk = ~clk;
    task automatic check_count(input logic [3:0] expected, input string message);
        #1;
        if (count !== expected) begin
            errors++;
            $error("FAIL: %s | expected=%0d, got=%0d", message, expected, count);
        end else
            $display("PASS: %s | count=%0d", message, count);
    endtask
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, updown_counter_tb);
        $display("=== 4-bit UP/DOWN Counter Test ===");
        rst = 1'b1;
        repeat (2) @(posedge clk);
        check_count(4'd0, "reset");
        rst = 1'b0;
        up_down = 1'b1;
        @(posedge clk); check_count(4'd1, "UP 0->1");
        @(posedge clk); check_count(4'd2, "UP 1->2");
        @(posedge clk); check_count(4'd3, "UP 2->3");
        @(posedge clk); check_count(4'd4, "UP 3->4");
        @(posedge clk); check_count(4'd5, "UP 4->5");
        @(posedge clk); check_count(4'd6, "UP 5->6");
        up_down = 1'b0;
        @(posedge clk); check_count(4'd5, "DOWN 6->5");
        @(posedge clk); check_count(4'd4, "DOWN 5->4 (first 4)");
        @(posedge clk); check_count(4'd4, "DOWN 4->4 (second 4)");
        @(posedge clk); check_count(4'd3, "DOWN 4->3");
        @(posedge clk); check_count(4'd2, "DOWN 3->2");
        @(posedge clk); check_count(4'd1, "DOWN 2->1");
        @(posedge clk); check_count(4'd0, "DOWN 1->0");
        @(posedge clk); check_count(4'd15, "DOWN 0->15 wrap");
        up_down = 1'b1;
        repeat (7) @(posedge clk);
        check_count(4'd6, "UP back to 6");
        up_down = 1'b0;
        @(posedge clk); check_count(4'd5, "DOWN 6->5 (again)");
        @(posedge clk); check_count(4'd4, "first 4 (again)");
        @(posedge clk); check_count(4'd4, "second 4 (in ST_HOLD_4)");
        up_down = 1'b1;
        @(posedge clk); check_count(4'd5, "HOLD -> UP 4->5");
        if (errors == 0)
          $display("=== ALL 20 CHECKS PASSED ===");
        else
            $display("=== %0d CHECK(S) FAILED ===", errors);

        $finish;
    end

endmodule
