	.include "macro.inc"

	.syntax unified

	thumb_func_start IsAnyPlayerSideWindowRetracting
IsAnyPlayerSideWindowRetracting: @ 0x0808630C
	push {lr}
	ldr r0, _08086354 @ =0x08CC2C60
	bl Proc_Find
	cmp r0, #0
	beq _08086324
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086350
_08086324:
	ldr r0, _08086358 @ =0x08CC2C00
	bl Proc_Find
	cmp r0, #0
	beq _0808633A
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086350
_0808633A:
	ldr r0, _0808635C @ =0x08CC2D38
	bl Proc_Find
	cmp r0, #0
	beq _08086360
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08086360
_08086350:
	movs r0, #1
	b _08086362
	.align 2, 0
_08086354: .4byte 0x08CC2C60
_08086358: .4byte 0x08CC2C00
_0808635C: .4byte 0x08CC2D38
_08086360:
	movs r0, #0
_08086362:
	pop {r1}
	bx r1
	.align 2, 0
