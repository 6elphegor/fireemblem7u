	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057F90
sub_08057F90: @ 0x08057F90
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08057FD4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057FD8 @ =0x08BA19C4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x37
	strh r0, [r4, #0x2e]
	ldr r3, _08057FDC @ =0x08BAC744
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057FE0
	ldrh r0, [r6, #2]
	adds r0, #0x24
	b _08057FE4
	.align 2, 0
_08057FD4: .4byte 0x0201774C
_08057FD8: .4byte 0x08BA19C4
_08057FDC: .4byte 0x08BAC744
_08057FE0:
	ldrh r0, [r6, #2]
	subs r0, #0x24
_08057FE4:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	adds r0, #0xc
	strh r0, [r6, #4]
	ldr r0, _08058008 @ =0x081F0300
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805800C @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058008: .4byte 0x081F0300
_0805800C: .4byte 0x081EE51C
