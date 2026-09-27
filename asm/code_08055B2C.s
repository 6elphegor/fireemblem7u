	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxRestWINMain
EfxRestWINMain: @ 0x08055B2C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08055B74 @ =0x0201FB20
	ldr r0, [r0]
	ldr r5, _08055B78 @ =0x0201FB2C
	cmp r0, #0
	bne _08055B3C
	ldr r5, _08055B7C @ =0x0201FC6C
_08055B3C:
	ldr r1, [r4, #0x54]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r1, [r4, #0x58]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _08055B80 @ =0x0000FFFF
	cmp r2, r0
	beq _08055BA8
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	movs r2, #0
	ldr r6, [r4, #0x44]
	ldr r7, _08055B84 @ =0x00007FFF
	mov ip, r7
_08055B64:
	ldrh r1, [r3]
	movs r7, #0
	ldrsh r0, [r3, r7]
	cmp r0, ip
	bne _08055B88
	movs r0, #0
	b _08055B9A
	.align 2, 0
_08055B74: .4byte 0x0201FB20
_08055B78: .4byte 0x0201FB2C
_08055B7C: .4byte 0x0201FC6C
_08055B80: .4byte 0x0000FFFF
_08055B84: .4byte 0x00007FFF
_08055B88:
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	ldrh r7, [r3, #2]
	adds r0, r0, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
_08055B9A:
	strh r0, [r5]
	adds r3, #4
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08055B64
	b _08055BB8
_08055BA8:
	movs r2, #0
	ldr r6, [r4, #0x44]
	movs r0, #0
_08055BAE:
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	cmp r2, #0x77
	bls _08055BAE
_08055BB8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r6
	bne _08055BD4
	ldr r1, _08055BDC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08055BD4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055BDC: .4byte 0x0201774C
