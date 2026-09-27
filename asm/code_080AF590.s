	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF590
sub_080AF590: @ 0x080AF590
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, _080AF5F4 @ =0x02022860
	movs r1, #0
	movs r4, #0xf
	ldr r2, _080AF5F8 @ =0x000003FE
	adds r0, r0, r2
_080AF5A2:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080AF5A2
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r5, r2, #0
_080AF5C4:
	ldrb r0, [r7]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AF5E4
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080AF5E4:
	adds r4, #1
	cmp r4, #7
	ble _080AF5C4
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF5F4: .4byte 0x02022860
_080AF5F8: .4byte 0x000003FE
