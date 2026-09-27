	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuOnHBlank
SaveMenuOnHBlank: @ 0x080A32D4
	push {lr}
	ldr r0, _080A3310 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080A32E6
	movs r2, #0
_080A32E6:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080A3342
	ldr r3, _080A3314 @ =0x02000000
	ldrb r0, [r3]
	cmp r2, r0
	bhs _080A3328
	ldr r0, _080A3318 @ =0x04000050
	movs r1, #0xc1
	strh r1, [r0]
	ldrb r0, [r3]
	cmp r0, #0
	beq _080A331C
	adds r1, r0, #0
	subs r0, r1, r2
	lsls r0, r0, #4
	bl __divsi3
	adds r1, r0, #0
	b _080A331E
	.align 2, 0
_080A3310: .4byte 0x04000006
_080A3314: .4byte 0x02000000
_080A3318: .4byte 0x04000050
_080A331C:
	movs r1, #0
_080A331E:
	ldr r0, _080A3324 @ =0x04000054
	strh r1, [r0]
	b _080A3342
	.align 2, 0
_080A3324: .4byte 0x04000054
_080A3328:
	ldr r1, _080A3348 @ =0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080A334C @ =0x04000052
	ldr r1, _080A3350 @ =0x02000001
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_080A3342:
	pop {r0}
	bx r0
	.align 2, 0
_080A3348: .4byte 0x04000050
_080A334C: .4byte 0x04000052
_080A3350: .4byte 0x02000001
