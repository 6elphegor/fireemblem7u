	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4890
sub_080B4890: @ 0x080B4890
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080B48FC @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r4, r1, r0
	cmp r5, #0
	beq _080B48F4
	ldr r6, [r4, #4]
	cmp r6, #0
	beq _080B48F4
	ldrb r1, [r4, #9]
	lsls r0, r1, #5
	ldr r1, _080B4900 @ =0x02022A60
	adds r0, r0, r1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r6, #0x58]
	movs r1, #0xa
	bl sub_0806E220
	movs r1, #0xff
	ldrb r0, [r4, #8]
	orrs r0, r1
	strb r0, [r4, #8]
	ldrb r0, [r4, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0x20
	strb r0, [r1]
_080B48F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B48FC: .4byte 0x08CE76C8
_080B4900: .4byte 0x02022A60
