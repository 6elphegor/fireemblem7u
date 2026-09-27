	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxExcaliburOBJ
StartSubSpell_efxExcaliburOBJ: @ 0x080605F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060648 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806064C @ =0x08BA3BCC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08060650 @ =0x08BD3758
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #2]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldr r0, _08060654 @ =0x08298D38
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060658 @ =0x082988DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060648: .4byte 0x0201774C
_0806064C: .4byte 0x08BA3BCC
_08060650: .4byte 0x08BD3758
_08060654: .4byte 0x08298D38
_08060658: .4byte 0x082988DC
