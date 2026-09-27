	.include "macro.inc"

	.syntax unified

	thumb_func_start WmUpdateCamera
WmUpdateCamera: @ 0x080B3338
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _080B33B4 @ =0x02000000
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _080B33AE
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080B3356
	cmp r1, r0
	beq _080B3356
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
_080B3356:
	adds r3, r4, #0
	ldr r1, [r3, #8]
	ldr r0, [r3, #4]
	cmp r1, r0
	beq _080B33AE
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080B336A
	adds r0, #7
_080B336A:
	asrs r0, r0, #3
	movs r2, #6
	ldrsh r1, [r3, r2]
	cmp r1, #0
	bge _080B3376
	adds r1, #7
_080B3376:
	asrs r1, r1, #3
	movs r5, #8
	ldrsh r2, [r3, r5]
	cmp r2, #0
	bge _080B3382
	adds r2, #7
_080B3382:
	asrs r2, r2, #3
	movs r5, #0xa
	ldrsh r3, [r3, r5]
	cmp r3, #0
	bge _080B338E
	adds r3, #7
_080B338E:
	asrs r3, r3, #3
	bl WmDrawMapRegion
	movs r2, #0xff
	adds r1, r2, #0
	ldrh r0, [r4, #8]
	ands r1, r0
	ldrh r5, [r4, #0xa]
	ands r2, r5
	movs r0, #3
	bl SetBgOffset
	ldrh r0, [r4, #8]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #6]
_080B33AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B33B4: .4byte 0x02000000
