	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTotalGlobalSupportValue
GetTotalGlobalSupportValue: @ 0x0809EC4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	bne _0809EC60
	mov r4, sp
	mov r0, sp
	bl ReadGlobalSaveInfo
_0809EC60:
	movs r0, #0
	adds r7, r4, #0
	adds r7, #0x20
	movs r6, #3
_0809EC68:
	movs r2, #0
	adds r4, r0, #1
	adds r0, r7, r0
	ldrb r3, [r0]
_0809EC70:
	lsls r1, r2, #1
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r6
	adds r5, r5, r0
	adds r2, #1
	cmp r2, #3
	ble _0809EC70
	adds r0, r4, #0
	cmp r0, #0x1f
	ble _0809EC68
	adds r0, r5, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
