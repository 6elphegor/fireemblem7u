	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B798
sub_0805B798: @ 0x0805B798
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0805B824 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B828 @ =0x08BA2BF8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x1e
	bl sub_080672E8
	adds r0, #0x8c
	strh r0, [r4, #0x2e]
	movs r0, #0x1e
	bl sub_080672E8
	adds r5, r0, #0
	movs r0, #0x1e
	bl sub_080672E8
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x46
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x28
	strh r0, [r4, #0x34]
	ldr r0, _0805B82C @ =0x0000FFEC
	strh r0, [r4, #0x3a]
	movs r0, #0xa0
	strh r0, [r4, #0x3c]
	ldr r0, _0805B830 @ =0x0203E02C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0805B7F8
	adds r0, r5, #0
	adds r0, #0x5e
	strh r0, [r4, #0x32]
	adds r0, r1, #0
	adds r0, #0x40
	strh r0, [r4, #0x34]
_0805B7F8:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _0805B810
	movs r0, #0xf0
	ldrh r2, [r4, #0x32]
	subs r1, r0, r2
	strh r1, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	subs r0, r0, r1
	strh r0, [r4, #0x34]
_0805B810:
	movs r0, #2
	bl sub_080672E8
	cmp r0, #0
	beq _0805B838
	cmp r0, #1
	beq _0805B840
	ldr r0, _0805B834 @ =0x08BD17C8
	b _0805B842
	.align 2, 0
_0805B824: .4byte 0x0201774C
_0805B828: .4byte 0x08BA2BF8
_0805B82C: .4byte 0x0000FFEC
_0805B830: .4byte 0x0203E02C
_0805B834: .4byte 0x08BD17C8
_0805B838:
	ldr r0, _0805B83C @ =0x08BD17B8
	b _0805B842
	.align 2, 0
_0805B83C: .4byte 0x08BD17B8
_0805B840:
	ldr r0, _0805B860 @ =0x08BD17C0
_0805B842:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r1, #0
	bne _0805B868
	ldr r1, _0805B864 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_End
	b _0805B876
	.align 2, 0
_0805B860: .4byte 0x08BD17C0
_0805B864: .4byte 0x0201774C
_0805B868:
	movs r0, #0x91
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0805B876:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
