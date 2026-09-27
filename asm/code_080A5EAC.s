	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5EAC
sub_080A5EAC: @ 0x080A5EAC
	push {r4, lr}
	ldr r3, [r2, #0x34]
	movs r2, #0x32
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r4, ip
	strb r1, [r4]
	movs r1, #0x33
	adds r1, r1, r3
	mov ip, r1
	movs r1, #1
	mov r4, ip
	strb r1, [r4]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
