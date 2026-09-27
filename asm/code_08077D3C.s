	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_OnHBlank
QuintessenceFx_OnHBlank: @ 0x08077D3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077D64 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077D70
	ldr r0, _08077D68 @ =0x0203E668
	ldr r1, _08077D6C @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077D7E
	.align 2, 0
_08077D64: .4byte 0x04000006
_08077D68: .4byte 0x0203E668
_08077D6C: .4byte 0x0203E660
_08077D70:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077D7E:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077DD0
	ldr r0, _08077DD8 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077DDC @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldr r1, _08077DE0 @ =0x03002870
	ldrh r2, [r2]
	ldrh r1, [r1, #0x24]
	adds r2, r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08077DE4 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077DDC @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldr r2, _08077DE0 @ =0x03002870
	ldrh r1, [r1]
	ldrh r2, [r2, #0x26]
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_08077DD0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077DD8: .4byte 0x04000018
_08077DDC: .4byte 0x0203E668
_08077DE0: .4byte 0x03002870
_08077DE4: .4byte 0x0400001A
