	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A434
sub_0807A434: @ 0x0807A434
	push {lr}
	ldr r0, _0807A44C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807A446
	movs r1, #1
_0807A446:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A44C: .4byte 0x03004690
