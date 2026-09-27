	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805C084
sub_0805C084: @ 0x0805C084
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0805C0C8
	ldr r0, _0805C0BC @ =0x08BBA5D4
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _0805C0C0 @ =0x0824D5C0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C0C4 @ =0x0824CD2C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _0805C0D8
	.align 2, 0
_0805C0BC: .4byte 0x08BBA5D4
_0805C0C0: .4byte 0x0824D5C0
_0805C0C4: .4byte 0x0824CD2C
_0805C0C8:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0805C0D8
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0805C0D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
