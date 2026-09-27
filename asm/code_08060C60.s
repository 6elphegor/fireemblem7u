	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060C60
sub_08060C60: @ 0x08060C60
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08060CB4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060CB8 @ =0x08BA3CA4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08060CBC @ =0x08BD3E44
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r0, _08060CC0 @ =0x0829DA8C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060CC4 @ =0x0829D2A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060CB4: .4byte 0x0201774C
_08060CB8: .4byte 0x08BA3CA4
_08060CBC: .4byte 0x08BD3E44
_08060CC0: .4byte 0x0829DA8C
_08060CC4: .4byte 0x0829D2A0
