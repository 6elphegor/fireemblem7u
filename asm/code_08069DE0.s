	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPartsofScroll2HBlank
EfxPartsofScroll2HBlank: @ 0x08069DE0
	push {r4, r5, r6, lr}
	ldr r0, _08069E1C @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08069E14
	ldr r3, _08069E20 @ =0x0400001A
	ldr r4, _08069E24 @ =0x03002870
	ldr r2, _08069E28 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r5, [r4, #0x26]
	ldrh r6, [r0]
	adds r1, r5, r6
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08069E2C @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r4, [r4, #0x22]
	ldrh r5, [r0]
	adds r1, r4, r5
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08069E14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069E1C: .4byte 0x04000004
_08069E20: .4byte 0x0400001A
_08069E24: .4byte 0x03002870
_08069E28: .4byte 0x0201FB28
_08069E2C: .4byte 0x0201FDB4
