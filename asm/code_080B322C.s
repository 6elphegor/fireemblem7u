	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B322C
sub_080B322C: @ 0x080B322C
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080B3280 @ =0x02000000
	movs r2, #0
	strb r0, [r1]
	adds r3, r1, #0
	cmp r0, #1
	bne _080B3284
	strh r4, [r3, #8]
	strh r5, [r3, #0xa]
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _080B324E
	strh r2, [r3, #8]
_080B324E:
	movs r1, #8
	ldrsh r0, [r3, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B325C
	strh r1, [r3, #8]
_080B325C:
	movs r4, #0xa
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bge _080B3266
	strh r2, [r3, #0xa]
_080B3266:
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B3274
	strh r1, [r3, #0xa]
_080B3274:
	ldrh r0, [r3, #8]
	strh r0, [r3, #4]
	ldrh r0, [r3, #0xa]
	strh r0, [r3, #6]
	b _080B328C
	.align 2, 0
_080B3280: .4byte 0x02000000
_080B3284:
	strh r2, [r3, #4]
	strh r2, [r3, #8]
	strh r2, [r3, #6]
	strh r2, [r3, #0xa]
_080B328C:
	ldrb r0, [r3]
	movs r2, #4
	ldrsh r1, [r3, r2]
	movs r4, #6
	ldrsh r2, [r3, r4]
	bl sub_080B5D9C
	pop {r4, r5}
	pop {r0}
	bx r0
