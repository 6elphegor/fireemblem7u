	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809DED8
sub_0809DED8: @ 0x0809DED8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0809DFB8 @ =0x02014434
	ldr r0, _0809DFBC @ =0x02014408
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0809D914
	ldr r5, _0809DFC0 @ =0x020144E0
	strb r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0809D914
	strb r0, [r5, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_0809D914
	strb r0, [r5, #2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_0809D914
	strb r0, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_0809D914
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #3]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #5]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #6]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl sub_0809D914
	strb r0, [r5, #7]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_0809D914
	strb r0, [r5, #9]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_0809D914
	strb r0, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_0809D914
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_0809D914
	strb r0, [r5, #0xe]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #6
	bl sub_0809D914
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_0809D914
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x18
	bl sub_0809D914
	str r0, [r5, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809DFB8: .4byte 0x02014434
_0809DFBC: .4byte 0x02014408
_0809DFC0: .4byte 0x020144E0
