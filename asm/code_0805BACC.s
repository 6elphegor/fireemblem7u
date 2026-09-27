	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BACC
sub_0805BACC: @ 0x0805BACC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805BB28 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BB2C @ =0x08BA2C40
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	movs r0, #0x78
	bl sub_080672E8
	adds r1, r0, #0
	subs r1, #0x3c
	strh r1, [r5, #0x32]
	adds r0, #0xb4
	strh r0, [r5, #0x34]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r0, #0x34
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #1
	adds r1, #0xc0
	strh r1, [r5, #0x3a]
	ldr r1, _0805BB30 @ =0xFFFFFEB8
	adds r0, r0, r1
	strh r0, [r5, #0x3c]
	movs r0, #2
	bl sub_080672E8
	cmp r0, #1
	bne _0805BB38
	ldr r0, _0805BB34 @ =0x08BD1840
	b _0805BB3A
	.align 2, 0
_0805BB28: .4byte 0x0201774C
_0805BB2C: .4byte 0x08BA2C40
_0805BB30: .4byte 0xFFFFFEB8
_0805BB34: .4byte 0x08BD1840
_0805BB38:
	ldr r0, _0805BB58 @ =0x08BD185C
_0805BB3A:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
	cmp r1, #0
	bne _0805BB60
	ldr r1, _0805BB5C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_End
	b _0805BB6E
	.align 2, 0
_0805BB58: .4byte 0x08BD185C
_0805BB5C: .4byte 0x0201774C
_0805BB60:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0805BB6E:
	pop {r4, r5}
	pop {r0}
	bx r0
