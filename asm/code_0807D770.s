	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D770
sub_0807D770: @ 0x0807D770
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D784
	ldr r0, _0807D788 @ =0x08CBB48C
	bl Proc_BreakEach
_0807D784:
	pop {r0}
	bx r0
	.align 2, 0
_0807D788: .4byte 0x08CBB48C
