	.include "macro.inc"

	.syntax unified

	thumb_func_start IsMuActive
IsMuActive: @ 0x0806C0CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806C0E2
	movs r0, #0
	b _0806C0FC
_0806C0E2:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C0F0
	b _0806C0F4
_0806C0F0:
	movs r0, #0
	b _0806C0FC
_0806C0F4:
	movs r0, #1
	b _0806C0FC
_0806C0F8:
	.byte 0x00, 0x20, 0xFF, 0xE7
_0806C0FC:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
