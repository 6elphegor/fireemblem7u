	.include "macro.inc"

	.syntax unified

	thumb_func_start AddAsTarget_IfCanStealFrom
AddAsTarget_IfCanStealFrom: @ 0x080244AC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0x80
	bne _080244FC
	ldr r0, _080244F0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt _080244FC
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
_080244D0:
	ldrh r0, [r4]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080244F4
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
	b _080244FC
	.align 2, 0
_080244F0: .4byte 0x03004690
_080244F4:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _080244D0
_080244FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
