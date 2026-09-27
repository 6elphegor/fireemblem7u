	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BA364
sub_080BA364: @ 0x080BA364
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r3, _080BA39C @ =0x08CEEF68
	adds r6, r3, #0
	movs r5, #0x10
	movs r0, #0x60
	rsbs r0, r0, #0
	adds r4, r0, #0
_080BA374:
	ldr r0, [r3]
	adds r0, r0, r2
	strb r5, [r0]
	cmp r2, #0xf
	bgt _080BA384
	ldr r0, [r6]
	adds r0, r0, r2
	strb r2, [r0]
_080BA384:
	cmp r2, #0x90
	ble _080BA390
	ldr r0, [r3]
	adds r0, r0, r2
	subs r1, r4, r2
	strb r1, [r0]
_080BA390:
	adds r2, #1
	cmp r2, #0xa0
	ble _080BA374
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA39C: .4byte 0x08CEEF68
