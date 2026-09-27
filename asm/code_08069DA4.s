	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvupHBlank
EkrLvupHBlank: @ 0x08069DA4
	ldr r0, _08069DD0 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08069DCC
	ldr r3, _08069DD4 @ =0x04000018
	ldr r2, _08069DD8 @ =0x0201FB28
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08069DDC @ =0x0201FDB4
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_08069DCC:
	bx lr
	.align 2, 0
_08069DD0: .4byte 0x04000004
_08069DD4: .4byte 0x04000018
_08069DD8: .4byte 0x0201FB28
_08069DDC: .4byte 0x0201FDB4
