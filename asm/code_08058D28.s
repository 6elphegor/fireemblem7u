	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFimbulvetrOBJ2
StartSubSpell_efxFimbulvetrOBJ2: @ 0x08058D28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058D64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058D68 @ =0x08BA1CF4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _08058D6C @ =0x0826AC3C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08058D70 @ =0x0821C860
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058D64: .4byte 0x0201774C
_08058D68: .4byte 0x08BA1CF4
_08058D6C: .4byte 0x0826AC3C
_08058D70: .4byte 0x0821C860
