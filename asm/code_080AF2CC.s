	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF2CC
sub_080AF2CC: @ 0x080AF2CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x14
	bne _080AF2DE
	ldr r0, [r5, #0x3c]
	movs r1, #4
	bl Proc_Goto
_080AF2DE:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x4f
	bls _080AF2EE
	adds r0, r5, #0
	bl Proc_Break
	movs r0, #0
	b _080AF326
_080AF2EE:
	ldrh r6, [r5, #0x2a]
	adds r0, r6, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080AF322
	ldr r0, [r5, #0x30]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF322
	ldr r4, _080AF330 @ =0x02000000
	adds r0, r6, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r0, [r0]
	bl Proc_Break
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
_080AF322:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
_080AF326:
	strh r0, [r5, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF330: .4byte 0x02000000
