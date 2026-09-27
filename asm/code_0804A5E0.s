	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A5E0
sub_0804A5E0: @ 0x0804A5E0
	push {r4, lr}
	mov ip, r0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	mov r3, ip
	adds r3, #0x63
	movs r0, #0x10
	ldrb r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _0804A636
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r0, #1
	lsls r1, r1, #2
	mov r0, ip
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x2c
	ldrsh r1, [r0, r2]
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, #2
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804A630
	cmp r0, #1
	bne _0804A636
	adds r0, r3, #0
	bl DrawUiItemHover
	b _0804A636
_0804A630:
	adds r0, r3, #0
	bl ClearUiItemHover
_0804A636:
	pop {r4}
	pop {r0}
	bx r0
