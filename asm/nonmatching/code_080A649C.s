	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A649C
sub_080A649C: @ 0x080A649C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r5, #0
	movs r7, #0x1b
	movs r6, #0x1a
_080A64AE:
	ldr r1, _080A6524 @ =0x02000064
	adds r1, r5, r1
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldr r0, _080A6528 @ =0x02000068
	adds r0, r5, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080A64D2
	movs r0, #0x10
	orrs r4, r0
_080A64D2:
	cmp r1, #2
	bne _080A64DE
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64DE:
	cmp r1, #3
	bne _080A64EA
	movs r0, #0x40
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64EA:
	cmp r5, r8
	beq _080A64F6
	movs r0, #2
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080A64F6:
	movs r1, #1
	adds r0, r4, #0
	orrs r0, r1
	adds r1, r6, #0
	bl PutChapterTitlePalette
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutChapterTitlePalette
	adds r7, #2
	adds r6, #2
	adds r5, #1
	cmp r5, #2
	ble _080A64AE
	bl EnablePalSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6524: .4byte 0x02000064
_080A6528: .4byte 0x02000068
