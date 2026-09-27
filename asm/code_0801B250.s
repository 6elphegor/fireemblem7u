	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B250
sub_0801B250: @ 0x0801B250
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801B26C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #4
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B268
	adds r0, r2, #0
	bl Proc_Break
_0801B268:
	pop {r0}
	bx r0
	.align 2, 0
_0801B26C: .4byte 0x08B857F8
