	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B32CC
sub_080B32CC: @ 0x080B32CC
	push {r4, r5, lr}
	adds r3, r1, #0
	ldr r2, _080B3334 @ =0x02000000
	ldrb r1, [r2]
	cmp r1, #1
	bne _080B332C
	ldrh r4, [r2, #8]
	adds r1, r4, r0
	movs r4, #0
	strh r1, [r2, #8]
	ldrh r5, [r2, #0xa]
	adds r0, r5, r3
	strh r0, [r2, #0xa]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080B32EE
	strh r4, [r2, #8]
_080B32EE:
	movs r1, #8
	ldrsh r0, [r2, r1]
	movs r1, #0xc4
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B32FC
	strh r1, [r2, #8]
_080B32FC:
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _080B3306
	strh r4, [r2, #0xa]
_080B3306:
	movs r4, #0xa
	ldrsh r0, [r2, r4]
	movs r1, #0x84
	lsls r1, r1, #2
	cmp r0, r1
	ble _080B3314
	strh r1, [r2, #0xa]
_080B3314:
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	movs r5, #6
	ldrsh r2, [r2, r5]
	subs r1, r1, r2
	bl sub_080B303C
_080B332C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3334: .4byte 0x02000000
