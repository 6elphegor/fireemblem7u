	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D80C
sub_0807D80C: @ 0x0807D80C
	push {r4, lr}
	ldr r0, _0807D830 @ =0x0203A3F0
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _0807D838
	ldr r0, _0807D834 @ =0x0203A470
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _0807D838
	movs r0, #0
	b _0807D83A
	.align 2, 0
_0807D830: .4byte 0x0203A3F0
_0807D834: .4byte 0x0203A470
_0807D838:
	movs r0, #1
_0807D83A:
	pop {r4}
	pop {r1}
	bx r1
