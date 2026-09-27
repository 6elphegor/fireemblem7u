	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2A50
sub_080B2A50: @ 0x080B2A50
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2A7C @ =0x0203A7F4
	ldr r1, [r0]
	ldr r2, _080B2A80 @ =0x0203A3F0
	adds r0, r1, #0
	adds r1, r2, #0
	bl UpdateUnitFromBattle
	ldr r0, _080B2A84 @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A7C: .4byte 0x0203A7F4
_080B2A80: .4byte 0x0203A3F0
_080B2A84: .4byte 0x03004690
