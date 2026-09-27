	.include "macro.inc"

	.syntax unified

	thumb_func_start XMapTransfer_8048460
XMapTransfer_8048460: @ 0x08042DF8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, _08042E40 @ =0x08B98AEC
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08042E0A:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08042E14
	adds r4, #1
_08042E14:
	adds r1, #1
	cmp r1, #3
	ble _08042E0A
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042E32
	ldr r0, _08042E40 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi _08042E32
	cmp r4, #0
	beq _08042E44
_08042E32:
	adds r0, r5, #0
	movs r1, #0
	bl EventGotoLabel
_08042E3A:
	movs r0, #0
	b _08042E68
	.align 2, 0
_08042E40: .4byte 0x08B98AEC
_08042E44:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042E66
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042E3A
	adds r0, r5, #0
	movs r1, #5
	bl EventGotoLabel
	b _08042E3A
_08042E66:
	movs r0, #1
_08042E68:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
