	.include "macro.inc"

	.syntax unified

	thumb_func_start Minimap_PutViewport
Minimap_PutViewport: @ 0x080A2FB8
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _080A2FFC @ =0x0840F984
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	ldr r3, _080A3000 @ =0x0202BBB8
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _080A2FD4
	adds r1, #3
_080A2FD4:
	asrs r1, r1, #2
	ldr r0, [r4, #0x3c]
	adds r2, r0, r1
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080A2FE4
	adds r0, #3
_080A2FE4:
	asrs r0, r0, #2
	ldr r1, [r4, #0x40]
	adds r1, r1, r0
	adds r0, r2, #0
	mov r2, sp
	movs r3, #0
	bl PutOamHiRam
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2FFC: .4byte 0x0840F984
_080A3000: .4byte 0x0202BBB8
