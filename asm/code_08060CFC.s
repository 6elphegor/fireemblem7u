	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060CFC
sub_08060CFC: @ 0x08060CFC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060D58 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060D5C @ =0x08BA3CBC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _08060D60 @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, _08060D64 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _08060D68 @ =0x0829DDB8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060D6C @ =0x0829DAAC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060D58: .4byte 0x0201774C
_08060D5C: .4byte 0x08BA3CBC
_08060D60: .4byte 0x08BA14DC
_08060D64: .4byte 0x0000F3FF
_08060D68: .4byte 0x0829DDB8
_08060D6C: .4byte 0x0829DAAC
